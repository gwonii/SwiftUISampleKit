//
//  ContentView.swift
//  SwiftUISampleKit
//
//  Created by Hogwon CHOI on 2021/12/19.
//

import SwiftUI

struct LoginView: View {
    
    @State var loginMode: LoginMode = .login
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    Picker(selection: $loginMode, label: Text("Picker Label")) {
                        Text("Login")
                            .tag(LoginMode.login)
                        Text("Create Account")
                            .tag(LoginMode.createAccount)
                    }
                    .pickerStyle(.segmented)
                    .padding(.vertical, 12)
                    
                    if loginMode.isLoginMode {
                        Button {
                            // set profile image button action
                        } label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 80))
                                .padding(20)
                                .overlay(
                                    Circle()
                                        .stroke(.gray, lineWidth: 3)
                                )
                        }
                        .foregroundColor(.black)
                        .padding()
                    }
                    
                    VStack {
                        Group {
                            TextField("email", text: $email)
                                .keyboardType(.emailAddress)
                                .autocapitalization(.none)
                                .padding(12)
                            SecureField("password", text: $password)
                                .padding(12)
                        }
                        .background(Color.white)
                    }
                    .padding(.bottom, 12)
                    
                    Button {
                        // login or create account button action
                    } label: {
                        HStack {
                            Spacer()
                            Text(loginMode.title)
                                .font(.system(size: 16, weight: .medium))
                                .foregroundColor(Color.white)
                                .padding(.vertical, 8)
                            Spacer()
                        }
                        .background(Color.blue)
                    }
                }
                .padding()
            }
            .background(Color(.init(gray: 0, alpha: 0.05)))
            .navigationTitle(loginMode.title)
        }
    }
}

enum LoginMode: String {
    case login
    case createAccount
    
    var title: String {
        switch self {
            case .login:
                return "Log In"
            case .createAccount:
                return "Create Account"
        }
    }
    
    var isLoginMode: Bool {
        switch self {
            case .login:
                return true
            case .createAccount:
                return false
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
