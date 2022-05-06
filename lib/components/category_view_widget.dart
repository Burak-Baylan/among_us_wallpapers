import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../core/extensions/context_extensions.dart';
import '../core/extensions/double_extensions.dart';
import '../core/extensions/int_extensions.dart';
import '../core/widgets/border_container.dart';

class CategoryViewWiget extends StatefulWidget {
  CategoryViewWiget({
    Key? key,
    required this.link,
    this.title,
    this.onPressed,
  }) : super(key: key);

  String? title;
  String link;
  Function? onPressed;

  @override
  State<CategoryViewWiget> createState() => _CategoryViewWigetState();
}

class _CategoryViewWigetState extends State<CategoryViewWiget> {
  @override
  Widget build(BuildContext context) {
    return BorderContainer.all(
      margin: 10.0.edgeIntesetsAll,
      radius: 12,
      width: context.width,
      height: context.height / 1.25,
      child: Stack(
        children: [
          buildImageView,
          Align(
            child: buildCategoryTitle,
            alignment: Alignment.bottomCenter,
          ),
        ],
      ),
    );
  }

  Widget get buildImageView => CachedNetworkImage(
        fadeInDuration: 0.durationMilliseconds,
        filterQuality: FilterQuality.medium,
        placeholder: (context, url) => getBorder,
        placeholderFadeInDuration: 100.durationMilliseconds,
        imageBuilder: (context, provider) => imageView(provider),
        imageUrl: widget.link,
        fit: BoxFit.cover,
      );

  Widget get buildCategoryTitle {
    return widget.title != null ? buildCategoryTitleText() : Container();
  }

  Widget buildCategoryTitleText() {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Text(
        widget.title!,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade400,
          backgroundColor: Colors.black.withOpacity(0.3),
        ),
      ),
    );
  }

  Widget imageView(ImageProvider<Object> provider) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.grey.shade500, width: 0.3),
      ),
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      child: Ink.image(
        width: context.width,
        height: context.height / 1.25,
        image: provider,
        fit: BoxFit.cover,
        child: buildInkWell(),
      ),
    );
  }

  Widget buildInkWell() {
    return InkWell(
      onTap: () {
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      splashColor: Colors.grey.shade100.withOpacity(.0),
    );
  }

  BorderContainer get getBorder =>
      BorderContainer.all(radius: 10, color: Colors.grey);
}
