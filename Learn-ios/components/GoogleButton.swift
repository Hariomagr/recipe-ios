//
//  GoogleButton.swift
//  Learn-ios
//
//  Created by APPLE on 25/10/25.
//

import SwiftUI

struct GoogleButton: View {
    let onSuccess: () -> Void
    @State private var showAlert: Bool = false
    @State private var errorMessage: String = ""
    
    func handlePress() {
        Task {
            do {
                try await signInWithGoogle()
                onSuccess()
            } catch {
                showAlert = true
                errorMessage = error.localizedDescription
            }
        }
    }
    
    var body: some View {
        Button(action: handlePress) {
            Image("google")
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.all, 20)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.white, lineWidth: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .alert("Error Occurred", isPresented: $showAlert) {
        } message: {
            Text(errorMessage)
        }
    }
}
