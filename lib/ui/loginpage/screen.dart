import 'package:flutter/material.dart';
import 'package:greensheart_test/backend/auth/manager.dart';

class LoginScreen extends StatefulWidget {
    final String screenTitle; // Title of the screen (default given)
    final String loginTitle; // Title of the login form (default given)
    
    final VoidCallback onLogin; // Function to be called when login is successful

    const LoginScreen({
        super.key, 
        this.screenTitle = 'Login Screen', 
        this.loginTitle = 'Default Login',
        required this.onLogin
    });

    @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
    bool _loginFailed = false;

    final String _usernameFieldLabel = 'Username';
    final String _passwordFieldLabel = 'Password';
    final String _loginButtonLabel = 'Login';

    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final SnackBar _loginSuccessful = const SnackBar(
        content: Text('Login successful!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.0),
        shape: StadiumBorder(),
        duration: Duration(milliseconds: 500),
    );

    @override
    void dispose() {
        // Clean up the controller when the widget is disposed.
        _usernameController.dispose();
        _passwordController.dispose();

        super.dispose();
    }

    // ================================
    // Functional Methods
    // ================================
    // Logic for login
    void _initiateLogin() { 
        if (AuthenticationManager().loginUser(_usernameController.text, _passwordController.text)) {
            setState(() {
                _loginFailed = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(_loginSuccessful);

            widget.onLogin(); // call onLogin callback
        } else {
            setState(() {
                _loginFailed = true;
            });
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.screenTitle),
            ),
            body: Center(
                child: Container(
                    constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2.0
                        )
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                            Text(
                                widget.loginTitle,
                                style: const TextStyle(
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    controller: _usernameController,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        errorText: _loginFailed ? 'Incorrect $_usernameFieldLabel or $_passwordFieldLabel' : null,
                                        labelText: _usernameFieldLabel,
                                    ),
                                    textInputAction: TextInputAction.next,
                                ),
                            ),  
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    controller: _passwordController,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        errorText: _loginFailed ? 'Incorrect $_usernameFieldLabel or $_passwordFieldLabel' : null,
                                        labelText: _passwordFieldLabel,
                                    ),
                                    textInputAction: TextInputAction.send,
                                    onSubmitted: (_) => _initiateLogin(),
                                ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                    onPressed: _initiateLogin,
                                    child: Text(
                                        _loginButtonLabel
                                    ),
                                ),
                            ),
                        ],
                    ),
                ),
            ),
        );
    }
}