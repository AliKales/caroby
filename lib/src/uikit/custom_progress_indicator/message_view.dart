part of 'custom_progress_indicator.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key, required this.text, this.child});

  final String? text;
  final Widget? child;

  bool get _noChildOrText {
    return text.isEmptyOrNull && child == null;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
          ),
          width:
              _noChildOrText ? null : MediaQuery.of(context).size.width * 0.8,
          child:
              _noChildOrText ? _noChildWidget(context) : _childWidget(context),
        ),
      ),
    );
  }

  Padding _noChildWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.3),
      child: const CircularProgressIndicator.adaptive().center,
    );
  }

  Column _childWidget(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _spacer(context, 0.05),
        const CircularProgressIndicator.adaptive(),
        _spacer(context, 0.02),
        _child,
        _spacer(context, 0.05),
      ],
    );
  }

  Widget get _child {
    if (text.isNotEmptyAndNull) {
      return Text(
        text!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    } else if (child != null) {
      return child!;
    } else {
      return const SizedBox.shrink();
    }
  }

  static SizedBox _spacer(context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
