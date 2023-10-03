part of 'custom_dialog.dart';

class _TextFieldDialog extends StatefulWidget {
  const _TextFieldDialog({
    this.title,
    this.barrierDismissible = true,
    this.hintText,
  });

  final String? title;
  final String? hintText;
  final bool barrierDismissible;

  @override
  State<_TextFieldDialog> createState() => __TextFieldDialogState();
}

class __TextFieldDialogState extends State<_TextFieldDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onOk() {
    Navigator.pop(context, _controller.textTrim);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title ?? "").toEmpty(widget.title.isEmptyOrNull),
      content: _textField(),
      actions: [
        OKButton(context, onPressed: _onOk),
      ],
    );
  }

  DecoratedBox _textField() {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextFormField(
        controller: _controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          //don't change the padding
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: widget.hintText,
        ),
      ),
    );
  }
}
