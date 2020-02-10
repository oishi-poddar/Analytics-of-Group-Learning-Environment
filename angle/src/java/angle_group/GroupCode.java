/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package angle_group;

/**
 *
 * @author pratik
 */
public class GroupCode {
   public String generate(int id)
    {
        char arr0[] = {'x','a','1','l','p','c','5','y','z','f'};
        char arr1[] = {'p','9','r','6','3','d','s','2','t','n'};
        char arr2[] = {'q','g','4','j','5','e','v','f','y','8'};
        char arr3[] = {'z','f','9','k','7','s','m','n','i','6'};
        char arr4[] = {'c','1','2','m','k','6','w','e','o','j'};
        char arr5[] = {'s','z','k','c','h','g','a','9','q','e'};
       
        String s = "";
        s= s+arr5[(id/100000)%10]+arr4[(id/10000)%10]+arr3[(id/1000)%10]+arr2[(id/100)%10]+arr1[(id/10)%10]+arr0[id%10];
       return s;
    }
}
