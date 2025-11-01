//
//  firebase.swift
//  Learn-ios
//
//  Created by APPLE on 01/11/25.
//
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore
import GoogleSignIn

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

let db = Firestore.firestore()

struct User: Codable {
    let name: String
    let email: String
    let uid: String
}

func registerUser(email: String, password: String, name: String) async throws {
    let res = try await Auth.auth().createUser(withEmail: email, password: password)
    let uid = res.user.uid
    try await saveUserToDb(name: name, email: email, uid: uid)
}

func saveUserToDb(name: String, email: String, uid: String) async throws {
    let user = User(name: name, email: email, uid: uid)
    try await setData(collectionName: "users", documentName: uid, data: user)
}

func signInUserWithEmail(email: String, password: String) async throws {
    try await Auth.auth().signIn(withEmail: email, password: password)
}

func signInWithGoogle() async throws {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    let config = GIDConfiguration(clientID: clientID)
    GIDSignIn.sharedInstance.configuration = config
    
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
             let rootViewController = windowScene.windows.first?.rootViewController else {
           print("No root view controller found")
           return
    }
    
    let res = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
    let user = res.user
    guard let idToken = user.idToken?.tokenString
    else {
        throw "No id token found"
    }
    let credential = GoogleAuthProvider.credential(
        withIDToken: idToken,
        accessToken: user.accessToken.tokenString
    )
    let firebaseUser = try await Auth.auth().signIn(with: credential)
    let isExistingUser = try await hasData(collectionName: "users", documentName: firebaseUser.user.uid)
    if (!isExistingUser) {
        try await saveUserToDb(name: user.profile?.name ?? "", email: user.profile?.email ?? "", uid: firebaseUser.user.uid)
    }
}

func isLoggedIn() -> Bool {
    return Auth.auth().currentUser != nil
}

func setData<T: Encodable>(collectionName: String, documentName: String, data: T) async throws {
    try await db.collection(collectionName).document(documentName)
        .setData(from: data)
}

func hasData(collectionName: String, documentName: String) async throws -> Bool {
    return try await db.collection(collectionName).document(documentName).getDocument().exists
}
