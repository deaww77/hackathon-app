import SwiftUI

struct SigningView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var isActive: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                if(isActive){
                    LoginView()
                }
                Text("Sign In")
                    .font(.largeTitle)
                    .padding(.bottom, 40)
                
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.top, 10)
                
                Button(action: signIn) {
                    Text("Sign In")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(.top, 20)
                }
                
                Spacer()
                
                NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .alert(isPresented: $isShowingAlert) {
                Alert(title: Text("Sign In Failed"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
            .padding()
        }
    }
    private func signIn() {
        // ตัวอย่างการตรวจสอบล็อกอิน
        if username.isEmpty || password.isEmpty {
            alertMessage = "Please enter both username and password."
            isShowingAlert = true
        } else if username == "user" && password == "password" {
            alertMessage = "Sign In successful!"
            isShowingAlert = true
            isLoggedIn = true
        } else {
            alertMessage = "Invalid username or password."
            isShowingAlert = true
        }
    }
}

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to the Home Screen!")
                .font(.largeTitle)
                .padding()
            Spacer()
        }
        .navigationTitle("Home")
    }
}

struct SigningView_Previews: PreviewProvider {
    static var previews: some View {
        SigningView()
    }
}

