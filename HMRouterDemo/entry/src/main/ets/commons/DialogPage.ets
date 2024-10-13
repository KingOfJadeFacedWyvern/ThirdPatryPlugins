import { HMRouter , HMRouterMgr } from "@hadss/hmrouter";
//@HMRouter(dialog:true})弹框组件
@HMRouter({pageUrl:'DialogPage',dialog:true})
@Component
export struct DialogPage {
  build () {
    Stack() {
      Column () {
        Text('这是一个弹框') .onClick(() => {

          HMRouterMgr.pop()

        })
      }

      .width('80%')
      .height('30%')
      .backgroundColor (Color.White)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('rgba(0,0,0,0.5)')

  }
}