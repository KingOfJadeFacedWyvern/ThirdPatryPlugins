import { HMRouter , HMRouterMgr } from '@hadss/hmrouter'
import { UserInfo } from '../pages/Index'

@HMRouter({pageUrl:'PageB',singleton:true})
@Component
export struct PageB {
  @State param: UserInfo = {} as UserInfo
  aboutToAppear(): void {
    if (HMRouterMgr.getCurrentParam() ) {
      this.param = HMRouterMgr.getCurrentParam() as UserInfo

    }
  }
  build () {
    Column () {
      Text('PageB')
        .fontSize(50)
      Text(`用户名:${this.param.name}`)
              .fontSize(35)
      Text(`密码:${this.param.password}`)
              .fontSize(35)
      Button ('返回主页').onClick ((event: ClickEvent) => {
        HMRouterMgr.pop({
          // pageUrl:'PageA'
          param:'1111'
        })
      })
        .fontSize(30)
    }
  }
}