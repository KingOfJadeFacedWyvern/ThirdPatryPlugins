import { HMRouter } from "@hadss/hmrouter";

@HMRouter({pageUrl:'LoginPage'})
@Component
export struct LoginPage {
  build () {
    Column () {
      Text('Login')
        .fontSize(35)
    }
  }
}
