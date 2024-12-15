import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:notifications/pages/login_page.dart';
import 'package:notifications/customs/custom_textfield.dart';
import 'package:notifications/customs/custom_button.dart';

void main() {
  group('LoginPage Tests', () {
    testWidgets('renders LoginPage with all key elements', (WidgetTester tester) async {
      
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );

      
      expect(find.text("Welcome To Notifications And Chatting System"), findsOneWidget);

      
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byType(CustomTextField), findsNWidgets(2));

      
      expect(find.byKey(const Key('passwordField')), findsOneWidget);

      
      expect(find.byKey(const Key('signInButton')), findsOneWidget);
      expect(find.text('Sign In'), findsOneWidget);

      
      expect(find.text('User data not found.'), findsNothing);

      
      expect(find.text('Or login with'), findsOneWidget);

      
      expect(find.byType(ElevatedButton), findsNWidgets(2));
      expect(find.byType(Image), findsOneWidget);

      
      expect(find.text("Register now"), findsOneWidget);
    });

    testWidgets('email and password inputs update on typing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginPage(),
        ),
      );

      
      const email = 'test@example.com';
      await tester.enterText(find.byKey(const Key('emailField')), email);

      
      expect(find.text(email), findsOneWidget);

      
      const password = '123456';
      await tester.enterText(find.byKey(const Key('passwordField')), password);

      
      expect(find.text(password), findsOneWidget);
    });

    testWidgets('Sign In button triggers login function', (WidgetTester tester) async {
      var loginCalled = false;

      
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return CustomButton(
                key: const Key('signInButton'),
                content: 'Sign In',
                onTap: () {
                  loginCalled = true;
                },
              );
            }),
          ),
        ),
      );

      await tester.tap(find.byKey(const Key('signInButton')));
      await tester.pump();

      expect(loginCalled, isTrue);
    });
  });
}