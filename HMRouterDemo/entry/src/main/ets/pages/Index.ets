import { HMNavigation , HMPopInfo , HMRouterMgr } from '@hadss/hmrouter'
import { AttributeUpdater } from '@kit.ArkUI'

@Entry
@Component
struct Index {
  modifier: NavModifier = new NavModifier ()

  build () {
    Column () {
      HMNavigation ({
        navigationId: 'contentID' ,
        // homePageUrl:'PageA',
        options: {
          modifier: this.modifier
        }
      }) {
        Text ('玉面飞龙之王')
          .fontSize (50)
        Button ('跳转到我的主页').onClick ((event: ClickEvent) => {
          HMRouterMgr.push ({
            pageUrl: 'PageB' ,
            param: new UserInfo ()
          } , {
            onResult (popInfo: HMPopInfo) {
              const popName = popInfo.srcPageInfo.name
              console.log (JSON.stringify (popName))
              const popParam = popInfo.srcPageInfo.param
              console.log (JSON.stringify (popParam))
              const result = popInfo.result
              console.log (JSON.stringify (result))

            }
          })
        })
        .fontSize (30)
      }
    }
  }
}

class NavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier (instance: NavigationAttribute): void {
    instance.mode (NavigationMode.Stack)
    instance.navBarWidth ('100%')
    instance.hideTitleBar (true)
    instance.hideToolBar (true)
    // super.initializeModifier (instance)
  }
}

export class UserInfo {
  name: string = '我是用户名'
  password: string = '111'
}