---
title: Free shipping for certain products in Magento
hero_image: hero-magento-free-shipping-specific-products.jpg
hero_alt: Add a free shipping attribute per product in Magento
date: 2010-06-21 16:38 CDT
date_updated:
article_summary: Magento does not natively give us the option to assign free shipping to specific items. This write-up details how to add this feature without editing any core code.
---

> Note, I originally wrote and published this article for Immense Networks [on their website](http://www.immense.net/magento-free-shipping-certain-products/). There are great comments with solutions to apply this technique in newer versions of Magento on that site.

---

Magento does not natively give us the option to assign free shipping to specific items. This write-up details how to add this feature without editing any core code.

Jump to a section:

1. <a href="#addoption">Add free shipping option to products</a>
1. <a href="#makerule">Make free shipping price rule</a>
1. <a href="#enable">Enable free shipping in Magento</a>
1. <a href="#addtext">Add free shipping text to product pages, listings, and cart</a>

---

## Compatibility

Here is a list of known Magento versions and shipping methods this technique works with, based on personal success and community feedback. Please comment if you can confirm other shipping methods or versions to add to this list.

1.4.x, 1.5.x, 1.6.x, 1.7.x

---

<a id="addoption"></a>
## Section 1 of 4. Add free shipping option to products

The first thing we'll want to do is create a product attribute giving us the option to allow free shipping on our products. I find it easier to make this a drop-down box, shown below.

### Here's the goal:

![Free shipping](assets/images/articles/magento-01n.png)

1. Go to **Catalog > Attributes > Manage Attributes**
![Manage attributes](assets/images/articles/magento-11n.png)

2. Click **add new attribute**
![Add new attribute](assets/images/articles/magento-09n.png)

3. Fill in the fields as shown in the image below exactly. You may select your store name for the `Scope` if applicable. You may also name the Attribute Code something else, but keep it simple as we will be using this field later.
![Attribute properties](assets/images/articles/magento-08n.png)

4. Make sure to select `Yes` for the following choices to make the free shipping option visible on the front-end and use the attribute for `Price Rule Conditions`.
![Frontend properties](assets/images/articles/magento-07n.png)

5. Click **Manage Label/Options** from the left sidebar. The field under Admin is the text visible to administrators in the Magento backend (best to call this Free Shipping). Below, click **add an option** to make our drop-down choices. We only need to make one choice (Yes), which will turn free shipping on for a particular product. The admin field here will be the choice visible in the drop down menu. The field under your store name is the text front-end users will see. Position should be 1. **Do not set this as default** to avoid automatically giving all products a Yes value (that would be bad).
![Attribute label/options](assets/images/articles/magento-06n.png)

6. Our attribute is made, but we need to assign this new attribute to an attribute set to actually use it when creating or editing our products. Go to **Catalog > Attributes > Manage Attribute Sets**
![Manage attribute sets](assets/images/articles/magento-051n.png)

7. If you're lucky, you've been using the default attribute set for your products. If you're unlucky like me, you already have quite a few sets made. For this option to show up, you have to **select each attribute set and perform step #8 to each one**.
![Select attribute set](assets/images/articles/magento-04n.png)

8. After clicking an attribute set, you will see the free shipping attribute we created over in the Unassigned Attributes column to the right. Click+drag the attribute into one of the sections to the left. You can put this item anywhere you want, and this will determine where it is available in the Manage Products area. Typically, the General or Prices section makes the most sense here. **Remember to do this for every attribute set you want this available**
![Move unassigned attribute](assets/images/articles/magento-02n.png)

9. Now you should be able to go to **Catalog > Manage Products** and select a product from the list. Go to the section where you dragged the free shipping attribute under (General, in my case), and scroll down to find our new free shipping attribute.
![Select free shipping](assets/images/articles/magento-00n.png)

---

> **Right now:** Here's what we have. We just added an option to allow free shipping for products. Leaving the selection blank will do nothing, but selecting Yes will eventually allow free shipping for this specific product. However, free shipping will not be applied to the product just yet. Read on to learn how to get Magento to assign free shipping to products that have this attribute assigned to Yes.

---

<a id="#makerule"></a>
## Section 2 of 4. Make free shipping price rule

We have the interface set up, but now we have to make it function properly.

1. Click **Promotions > Shopping Cart Price Rules**
![Shopping cart price rules](assets/images/articles/7-9-2010-5-53-01-PMn.png)

2. Click **Add new rule**
![Add new rule](assets/images/articles/7-9-2010-5-53-22-PMn.png)

3. Give the rule a name and description (these are for administrator reference only). Set the status to **Active**. Be sure to to leave the "to date" blank, unless you want an expiration date for free shipping (note: if you set an expiration date, it will be site wide, not per product).
![Rule and name](assets/images/articles/7-9-2010-5-55-45-PMn.png)

4. Ignore the Conditions tab. Instead, click **Actions** in the left sidebar.

5. Match your fields with the ones in the image below.
  ![Free shipping actions](assets/images/articles/7-9-2010-5-56-48-PMn.png)

> Apply: Percent of product price discount
>
> Discount amount: 0
>
> Maximum Qty Discount: 0
>
> Discount Qty step: 0
>
> Free shipping: **For matching items only** (very important)
>
> Stop further rules processing: No

For the rules, keep the default "if ALL of these conditions are TRUE". Click the plus sign to add a condition. Select Free Shipping from the list. Click the ellipses and select Yes from the drop down (note: if Free Shipping is not in this list, refer back to step 4 in the last section, and make sure **Use for price rule conditions** is set to Yes).

![Free shipping rules](assets/images/articles/7-9-2010-5-57-57-PMn.png)
6. Save the rule

---

> **Right now:** We have added a Free shipping option to our products and created the conditions needed to apply the rule. The last thing we have to do is enable Magento's core free shipping option&hellip;kind of.

---

<a id="#enable"></a>
## Section 3 of 4. Enable free shipping

As we already know, Magento's core free shipping option only works for a minimum order amount; this is not what we're after. However, we do need to activate Magento's core free shipping function so it knows how to deal with our rule.

1. Click System > Configuration
2. Find Sales > Shipping Methods in the left sidebar.
3. The next step will be determined by your shipping method. I will cover external and internal calculators.

### Internal calculators

1. If you are not using external calculators, select Free Shipping from this list.
![Internal free shipping](assets/images/articles/7-9-2010-6-07-14-PMn.png)

2. Set Enabled to Yes. **Here's the trick**: Set the Minimum order amount to some outrageous number, like 9999999999.99. This lets us enable free shipping without having to worry about false positives.
![Internal free shipping settings](assets/images/articles/7-9-2010-6-07-58-PMn.png)

### Using a shipping provider (UPS, USPS, FedEx, DHL)

1. In my case, I use UPS for my shipping calculator. The other providers offer similar fields, so you should be able to follow along.

2. Fill in all appropriate fields, such as Gateway URL, allowed methods, etc. This data can be found on your shipping provider's website. (This information must be correct for Magento to reach the 3rd party calculator. Also, your shipping account must be in production mode)

3. We're most interested in the Free Method option. In my case, I want my products to receive Free Ground Shipping. Free shipping with minimum order amount is set to disabled. I still set my Minimum order amount to some outrageous number like 9999999999.99 just in case. This lets us enable free shipping without having to worry about false positives.
![UPS free shipping settings](assets/images/articles/7-9-2010-6-11-42-PMn.png)

4. Enable the provider.
![External shipping enabled](assets/images/articles/7-9-2010-6-17-21-PMn.png)

5. Test the free shipping rule by editing a product, select Yes for free shipping, add it to the cart, and run the Estimate shipping and tax quote. I chose Free Ground Shipping, so this is reflected by the quote generator.
![Test free shipping](assets/images/articles/7-9-2010-6-57-04-PMn.png)

---

> **Right now**: At this point, you can create or edit a product, select Yes from the free shipping drop-down box, and that product will receive free shipping. If users have an item with and without free shipping, it will only get applied to the ones with free shipping enabled (assuming you followed step 5 in the first section by selecting **For matching items only**). You could call it quits here, or read on to learn how to let customers know which items have free shipping enabled.

---

<a id="#addtext"></a>
## Section 4 of 4. Show free shipping dialogue to customers on front-end

### Here's the goal

![Free shipping on front-end](assets/images/articles/7-9-2010-6-30-40-PMn.png)

1. Locate the template file you want to add the Free Shipping text to, a product page, for instance. Finding specific template files is outside the scope of this tutorial.

2. Assuming you named your rule the same attribute code I did (`free_shipping_discount`) in step 3 of the first section, paste the following code wherever you want the free shipping text to show. The first line checks if the item has free shipping, second line displays the text, then end the if statement.

    ```php
    <?php if ($_product->getFreeShippingDiscount()) : ?>
        <span class="freeShip"><?php echo $_product->getAttributeText('free_shipping_discount'); ?></span>
    <?php endif; ?>
    ```
3. Notice I put the text to a p tag with a class. You can alter this however you wish. This lets me style the text and assign a background image to complete the effect.

4. It is best practice to also include this code on the shopping cart page since free shipping only applies to specific items. This will let users know which items in their cart receive free shipping.
![My shopping cart](assets/images/articles/7-9-2010-6-54-27-PMn.png)

The `cart.phtml` page requires a different call. Use the code below in your `template/checkout/cart/item/default.phtml`:

```php
<!-- if item has free shipping -->
<span class="free-ship"><?php echo Mage::getModel('catalog/product')->load($this->getProduct()->getId())->getAttributeText('free_shipping_discount') ;?></span>
```
