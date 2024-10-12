import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    final String screenTitle;
    final String loginTitle;
    final Widget targetScreen;

    const LoginScreen({
        super.key, 
        required this.screenTitle, 
        this.loginTitle = 'Default Login',
        required this.targetScreen,
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
    final SnackBar _loginFailedSnackBar = const SnackBar(
        content: Text('Login successful!'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.0),
        shape: StadiumBorder(),
        duration: Duration(seconds: 2),
    );

    @override
    void initState() {
        super.initState();
    }

    void _initiateLogin() {
        if (_usernameController.text == 'admin' && _passwordController.text == 'admin') {
            setState(() {
                _loginFailed = false;
            });
            ScaffoldMessenger.of(context).showSnackBar(_loginFailedSnackBar);

            Navigator.push(context, MaterialPageRoute(builder: (context) => widget.targetScreen));
        } else {
            setState(() {
                _loginFailed = true;
            });
        }
    }

    @override
    void dispose() {
        _usernameController.dispose();
        _passwordController.dispose();

        super.dispose();
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