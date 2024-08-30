import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isShowingAlert: Bool = false
    @State private var isShowingsuchseccAlert: Bool = false
    @State private var alertMessage: String = ""
    @State private var isActive: Bool = false
    @State private var openmain: Bool = false

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
                
                /*if(isShowingAlert && isActive && openmain){
                    MainMenuView()
                }*/
                NavigationLink(destination: MainMenuView(), isActive: $openmain) {
                    EmptyView()
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
            .alert(isPresented: $isShowingsuchseccAlert) {
                Alert(title: Text("Login success"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
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
        } else if username == "Root" && password == "Root" || username == "Root" && password == "root" {
            alertMessage = "Login successful!"
            isShowingsuchseccAlert = true
            isActive = true
            openmain = true
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

