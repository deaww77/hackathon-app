import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isActive: Bool = false

    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Button(action: login) {
                    Text("Login")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                Button(action: tosignin) {
                    Text("Sign In")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                
                NavigationLink(destination: SigningView(), isActive: $isActive) {
                    EmptyView()
                }
                
                Spacer()
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Login Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .padding()
        }
    }
    func tosignin(){
        isActive = true
    }
    private func login() {
        if username.isEmpty || password.isEmpty {
            alertMessage = "Please enter both username and password."
            isShowingAlert = true
        } else if username == "user" && password == "password" {
            alertMessage = "Login successful!"
            isShowingAlert = true
            isActive = true
        } else {
            alertMessage = "Invalid username or password."
            isShowingAlert = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

