import { HMRouter } from '@hadss/hmrouter'

@HMRouter({pageUrl:'PageA'})
@Component
export struct pageA {
  build () {
    Column () {
      Text ('真逍遥王')
      .fontSize (50)
    }
  }
}