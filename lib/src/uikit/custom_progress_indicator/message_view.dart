part of 'custom_progress_indicator.dart';

class MessageView extends StatelessWidget {
  const MessageView({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: context.colorScheme.background,
          borderRadius: const BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _spacer(context, 0.05),
            const CircularProgressIndicator.adaptive(),
            _spacer(context, 0.02),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            _spacer(context, 0.05),
          ],
        ),
      ),
    );
  }

  static SizedBox _spacer(context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
