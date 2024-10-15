import { HMInterceptor , HMInterceptorAction , HMInterceptorInfo , IHMInterceptor } from "@hadss/hmrouter";
@HMInterceptor({interceptorName:'CommonInterception',priority:1,global:true})
/*
 * 拦截器可以多个，责任链的模式
 *                1.HMInterceptorAction.DO_TRANSITION：跳过后续的拦截器，直接执行后面的页面效果
 *                2.HMInterceptorAction.DO_REJECT：直接结束拦截器，
 *                3.HMInterceptorAction.DO_NEXT：进行下一个拦截器
 * 拦截器可以设置是否全局生效，全局生效的情况下，拦截器会拦截所有页面的跳转，非全局生效的情况下，只拦截当前页面的跳转
 *                1.全局拦截器，在页面跳转的时候，会先执行全局拦截器，然后再执行当前页面的拦截器。需要设置global:true
 *                2.自定义拦截器，不需要设置global:true，并且需要再HMRouter中定义声明拦截器
 * Interception{"srcName":"HM_NavBar","targetName":"PageA","type":"push","routerPathInfo":{"pageUrl":"PageA"},"context":{"instanceId_":100000},"isSrc":false}
 *                1.srcName：来源页面
 *                2.targetName：目标页面，跳转结束时候展示页面
 *                3.type：跳转类型，push，pop，replace
 *                4.routerPathInfo：页面跳转信息路径，包含页面的url，param：以及页面参数
 *                5.context：页面跳转的上下文，可以获取到当前页面实例，以及跳转时的参数。每一个navigationId都对应一个UIContext
 *                6.isSrc：是否是发起页面，true：是，false：不是
 *
 * priority：优先级，数字越大，优先级越高，默认为1
 *                priority：如果这个优先一样的情况下，先会执行自定义拦截器HMRouter定义的拦截器，然后才会执行全局拦截器
 *
 * */

export class CommonInterception implements IHMInterceptor {
  handle (info: HMInterceptorInfo): HMInterceptorAction {
    console.log ('Interception'+JSON.stringify(info))
    return HMInterceptorAction.DO_TRANSITION
  }
}


















