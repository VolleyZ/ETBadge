# ETBadge
A tool of swift to add or clear badge for any UIView。You can use it easily, also can custom it.

![demo](https://github.com/VolleyZ/ETBadge/blob/master/20170419-175333-HD.gif)


Installation
============

The preferred way of installation is via [CocoaPods](http://cocoapods.org). Just add

```ruby
pod 'ETBadge'
```

and run `pod install`. It will install the most recent version of ETBadge.

Usage
===============
1. Add the following import to the top of the file:
> import ETBadge

 2. Use the following to display badge easily:

> badgeView.showBadge(withStyle: .redDot, value: 1, aniType: .none)

> badgeView.showBadge(withStyle: .new, value: 1, aniType: .breathe)

> badgeView.showBadge(withStyle: .number, value: 1, aniType: .scale)

or simply call interface: **badgeView.showBadge()**
 
3. Use the following to hide badge easily:
 
> badgeView.clearBadge();

4.Use the following to resume badge when it has been hidden:

> badgeView.resumeBadge();

----------


BADGE CUSTOMIZATION
--------------------
Feel free to customize badge size, position, animation style or anything else.

ETBadge provides easy way to customize its style.:

    public struct ETBadgeConfigure {
      var badgeFont: UIFont = UIFont.boldSystemFont(ofSize: 10)
      var badgeBgColor: UIColor = UIColor.red
      var badgeTextColor: UIColor = UIColor.white
      var aniType: ETBadgeAnimType = .none
      var badgeCenterOffset: CGPoint = CGPoint.zero
      var badgeStyle: ETBadgeStyle = .redDot
      var badgeMaximumBadgeNumber: Int = 99
      var badgeRedDotWidth: CGFloat = 8
      var badgeTextMargin: CGFloat = 6
      var badgeBounds: CGSize = CGSize(width: 16, height: 16)
    }
You can customize style which you like.Simple used:
> badgeView.badgeConfig.badgeBgColor = UIColor.yellow


## Requirements

- iOS 8.0+ 
- Xcode 8.1+
- Swift 3.0+

----------
----------
LICENSE
--------------------
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
