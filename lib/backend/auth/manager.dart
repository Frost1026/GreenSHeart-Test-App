import 'dart:collection';

class AuthenticationManager {
    static final AuthenticationManager _instance = AuthenticationManager._internal();
    factory AuthenticationManager() => _instance;

    // {'username': [password, privilege]} privilege: 3 = rw, 2 = r, 1 = w, 0 = none
    static final HashMap<String, List<dynamic>> _userCredentials = HashMap<String, List<dynamic>>();

    // private constructor
    AuthenticationManager._internal() {
        _userCredentials['admin'] = ['admin', 3];
    }

    // ================================
    // Functional Methods
    // ================================
    bool addNewUser(String username, String password, int privilege) {
        // return false on user exists
        if(_userCredentials.containsKey(username)) return false;

        _userCredentials[username] = [password, privilege];

        // Verify if user added
        if(_userCredentials[username] != null) return true;
        return false;
    }

    bool removeUser(String username) {
        // Only remove is username exists
        if(_userCredentials.containsKey(username)) {
            _userCredentials.remove(username);
            return true;
        } 
        return false;
    }

    bool updateUser(String username, String password, int privilege) {
        if(_userCredentials.containsKey(username)) {
            _userCredentials[username] = [password, privilege];
            return true;
        }
        return false;
    }

    bool updateUserPrivilege(String username, int privilege) {
        if(_userCredentials.containsKey(username)) {
            _userCredentials[username]![1] = privilege;
            return true;
        }
        return false;
    }

    bool updateUserPassword(String username, String password) {
        if(_userCredentials.containsKey(username)) {
            _userCredentials[username]![0] = password;
            return true;
        }
        return false;
    }

    bool loginUser(String username, String password) {
        if(_userCredentials.containsKey(username)) {
            if(_userCredentials[username]![0] == password) {
                return true;
            }
        }
        return false;
    }
    // ================================
    // Getters and setters
    // ================================
    
    HashMap<String, List<dynamic>> get userCredentials => _userCredentials;
}