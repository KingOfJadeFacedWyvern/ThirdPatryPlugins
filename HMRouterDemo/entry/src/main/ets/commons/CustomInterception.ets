import { HMInterceptor , HMInterceptorAction , HMInterceptorInfo , HMRouterMgr , IHMInterceptor } from "@hadss/hmrouter";
@HMInterceptor({interceptorName:'CustomInterception',priority:1})
export class CustomInterception implements IHMInterceptor {
  handle (info: HMInterceptorInfo): HMInterceptorAction {
    // console.log ('CustomInterception'+JSON.stringify(info))
    // !!:两次取反，会代表的是个真的假值，还是真的真值。一个小技巧
    if (!!AppStorage.get('Token')) {
      return HMInterceptorAction.DO_NEXT

    }else {
      info.context.getPromptAction().showToast({ message: '请先登录' })
      HMRouterMgr.push({
        pageUrl: 'LoginPage',
        param:info.targetName,
        skipAllInterceptor:true
      })
    }
    return HMInterceptorAction.DO_REJECT
  }
}