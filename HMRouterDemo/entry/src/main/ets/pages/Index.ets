import { HMDefaultGlobalAnimator , HMNavigation , HMPopInfo , HMRouterMgr } from '@hadss/hmrouter'
import { AttributeUpdater } from '@kit.ArkUI'
import { CustomAnimator } from '../commons/CustomAnimator'
import { globalDialogEffectPage , globalTransitionEffectPage } from '../commons/GlobalAnimatorPage'

@Entry
@Component
struct Index {
  modifier: NavModifier = new NavModifier ()

  build () {
    Column ({ space: 20 }) {
      HMNavigation ({
        navigationId: 'contentID' ,
        // homePageUrl: 'PageA' ,
        options: {
          modifier: this.modifier ,
          // 全局动画效果 ↓
          standardAnimator: globalTransitionEffectPage ,
          dialogAnimator: globalDialogEffectPage
          //   全局动画效果 ↑
        }
      }) {
        Column ({ space: 10 }) {
          Button ('跳转到PageA').onClick ((event: ClickEvent) => {
            HMRouterMgr.push ({
              pageUrl: 'PageA'
            })
          })
          Text ('飞龙')
            .fontSize (50)
          Button ('跳转到我的主页').onClick ((event: ClickEvent) => {
            HMRouterMgr.push ({
              pageUrl: 'PageB' ,
              param: new UserInfo (),
              // animator: new CustomAnimator ()
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
            .fontSize (20)
          Button ('弹框').onClick ((event: ClickEvent) => {
            HMRouterMgr.push ({
              pageUrl: 'DialogPage'
            })
          })
        }

      }
    }
  }
}

class NavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier (instance: NavigationAttribute): void {
    instance.mode (NavigationMode.Stack)
    instance.navBarWidth ('50%')
    instance.hideTitleBar (true)
    instance.hideToolBar (true)
    // super.initializeModifier (instance)
  }
}

export class UserInfo {
  name: string = '飞龙'
  password: string = '111'
}