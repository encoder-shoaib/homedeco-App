import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(
            '''
Privacy Policy for HomeEase

Last updated: April 13, 2025

We value your privacy and are committed to protecting your personal information. This Privacy Policy explains how HomeEase collects, uses, and safeguards your data.

1. Information We Collect
- Email addresses for account creation
- User preferences (e.g., theme settings)
- Browsing behavior for personalized recommendations

2. How We Use Your Information
- To provide and improve our services
- To personalize your shopping experience
- To send promotional offers (with your consent)

3. Data Sharing
We do not share your personal information with third parties except as required by law or to fulfill services (e.g., payment processing).

4. User Consent
By using HomeEase, you consent to the collection and use of your information as described in this policy.

5. Contact Us
For questions, contact us at support@homeease.com.
            ''',
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}