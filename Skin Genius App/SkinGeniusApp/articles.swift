import Foundation

class Article {
    let title: String
    let imageName: String
    let subtitle: String
    let longDescription: String

    init(title: String, imageName: String, subtitle: String, longDescription: String) {
        self.title = title
        self.imageName = imageName
        self.subtitle = subtitle
        self.longDescription = longDescription
    }
}

// Define the first article
let firstArticleTitle = "The Basics of Skin Care"
let firstArticleImageName = "skin_care_1"
let firstArticleSubtitle = "3 mins read"

let firstArticleLongDescription = """
The skincare section of any store can seem overwhelming – from what kind of cleanser to use to which is serum is right to address your skin concern. We asked Kim Chang, licensed aesthetician with the Aesthetics Studio at Baylor Medicine, for tips on how to create a simple skincare routine, what items should you add in and more.

Q: What makes up a simple skincare routine?

A: The basic three: cleanse, moisturize and protect with sunscreen. It’s super simple but gets the job done. In the morning, cleanse your skin to start the day then put on a moisturizing sunscreen. At night, cleanse your skin again to remove any residual makeup and sweat from the day then  finish with a moisturizer. That’s only two products in the morning, and two products at night. Simple!

Q: What is something you would recommend adding to your routine?

A: Depending on your goal, such as reducing dark spots or acne flare-ups, adding an exfoliator at least three times a week to your regimen would be beneficial. Exfoliators with lactic acid, glycolic acid or even Retin-A are great. Different from just cleansing and protecting, exfoliating will cause actual change in your skin. I would also recommend a vitamin C serum, which is an antioxidant that helps prevent damage from free radicals in the skin that can cause premature aging. Before starting something new, take an unfiltered photo outside in natural light. Then take another picture three months later in the same location and lighting to see if the products are working for your skin.

Q: Are there certain products you should use depending on the time of day?

A: Everyone should be wearing sunscreen during the day, and some people who work at night, such as nurses, may even want to consider it to protect themselves from blue light in their workplace. Acids like lactic, glycolic and Retin-A should be reserved for nighttime use as they can cause skin sensitivity when exposed to the sun. Using vitamin C serum during the day is most beneficial. Remember, we’re using vitamin C serum to neutralize from free radicals that sun, ultraviolet rays and air pollution can trigger.

Q: You see many people online touting multistep skincare routines. Will that same routine work for my skin?

A: There’s really no “one-size fits all” routine. We all have our own specific  skincare goals, and your routine should be customized to meet those goals.

Q: Can you give us a rundown of your own skincare regimen?

A: It changes, but right now due to weather and some breakouts, this is what I’m doing:

Morning:

Cleanse
Vitamin C serum
Stem cell serum
Hyaluronic acid (HA) serum for specific areas
Eye cream over the whole eye – under and over
Spot treat with salicylic acid over some breakouts
Gel moisturizer
Tinted SPF
Evening

Double cleanse
Retinol
Nighttime antioxidant with resveratrol
Stem cell serum
HA serum
Eye cream
Neck cream
Moisturizer
I also exfoliate 3-4 times a week at night and use a mask after exfoliating before enjoying the rest of my skincare routine.

Q: If you can do nothing else, what is the one step you should do every day for your skin?

A: Cleanse your skin! Even if you didn’t wear makeup or go to the gym, your skin is still secreting oils that can grab bacteria from hands or pollutants in the air.
"""

// Creating the first article instance
let firstArticle = Article(title: firstArticleTitle, imageName: firstArticleImageName, subtitle: firstArticleSubtitle, longDescription: firstArticleLongDescription)

// Define the second article
let secondArticleTitle = "Advanced Skin Care Techniques"
let secondArticleImageName = "skin_care_2"
let secondArticleSubtitle = "5 mins read"

let secondArticleLongDescription = """
In recent years, the world of skincare has evolved dramatically, with advanced techniques and treatments emerging to address a variety of skin concerns. From innovative products to cutting-edge procedures, these methods promise to deliver radiant, youthful skin. Here’s a look at some of the most effective advanced skincare techniques that are making waves in the beauty industry.

1. Microneedling
Microneedling involves the use of fine needles to create tiny punctures in the skin. This process stimulates the body's natural healing response, encouraging collagen and elastin production. The result is smoother, firmer skin with reduced appearance of scars, fine lines, and large pores. When combined with serums or platelet-rich plasma (PRP), microneedling can enhance the absorption of beneficial ingredients, amplifying its effects.

2. Chemical Peels
Chemical peels use acidic solutions to exfoliate the outer layer of the skin, promoting cell turnover and revealing fresher, brighter skin underneath. There are various types of peels, ranging from superficial to deep, each tailored to different skin types and concerns. Regular chemical peels can help with hyperpigmentation, acne scars, and uneven skin tone.

3. Laser Therapy
Laser therapy encompasses a variety of treatments that use light energy to improve skin texture and tone. Fractional lasers, for instance, create micro-injuries that stimulate collagen production without damaging the surrounding tissue. Laser therapy can effectively address issues like wrinkles, sun damage, and vascular lesions, providing significant improvements with minimal downtime.

4. Radiofrequency (RF) Treatments
Radiofrequency treatments use energy waves to heat the deeper layers of the skin, which stimulates collagen production and tightens the skin. RF treatments can be used to contour the face and body, reducing the appearance of sagging skin and cellulite. When combined with microneedling, RF can enhance skin rejuvenation effects.

5. LED Light Therapy
LED light therapy utilizes different wavelengths of light to target various skin concerns. Blue light can kill acne-causing bacteria, red light stimulates collagen production, and near-infrared light promotes wound healing and reduces inflammation. This non-invasive treatment is suitable for all skin types and can be incorporated into regular skincare routines.

6. Hydrafacial
The Hydrafacial is a multi-step treatment that cleanses, exfoliates, and hydrates the skin. It combines microdermabrasion-like exfoliation with hydrating serums to remove dead skin cells and impurities while delivering moisture and antioxidants. This gentle yet effective treatment can improve skin texture, clarity, and overall radiance.

7. Cryotherapy
Cryotherapy involves exposing the skin to extremely cold temperatures for short periods. This can be done locally (targeting specific areas) or whole-body cryotherapy. The cold exposure can reduce inflammation, tighten pores, and boost collagen production. Regular cryotherapy sessions can lead to improved skin tone and firmness.

8. Advanced Topical Treatments
Innovative skincare products now incorporate advanced ingredients like peptides, growth factors, and stem cells. These products can penetrate deeper into the skin, delivering powerful anti-aging and regenerative benefits. For example, growth factors can promote cell renewal and repair, while peptides can stimulate collagen production and enhance skin elasticity.

Advanced skincare techniques offer a range of solutions for achieving and maintaining radiant, youthful skin. By leveraging the latest technologies and scientific advancements, these treatments can address a variety of skin concerns more effectively than ever before. Whether through professional treatments or advanced skincare products, investing in these techniques can yield significant improvements in skin health and appearance.
"""
let secondArticle = Article(title: secondArticleTitle, imageName: secondArticleImageName, subtitle: secondArticleSubtitle, longDescription: secondArticleLongDescription)
// Creating the second article instance

let thirdArticleTitle = "Natural and DIY Skin Care"
let thirdArticleImageName = "skin_care_3"
let thirdArticleSubtitle = "5 mins read"

let thirdArticleLongDescription = """
In recent years, there has been a noticeable shift towards embracing natural and do-it-yourself (DIY) skin care routines. With concerns about synthetic ingredients and environmental impact on the rise, many individuals are turning to nature's bounty and homemade remedies to nourish and rejuvenate their skin.

**The Appeal of Natural Ingredients:**
One of the primary draws of natural skin care is the use of ingredients sourced directly from the earth. Natural components such as honey, aloe vera, coconut oil, and shea butter are rich in vitamins, minerals, and antioxidants that can benefit the skin in various ways. These ingredients are often gentler on the skin, making them suitable for individuals with sensitive or reactive skin types.

**DIY Beauty Recipes:**
DIY skin care allows individuals to take control of what they apply to their skin, using simple ingredients found in their kitchen or garden. From facial masks and scrubs to toners and serums, the possibilities are endless.
"""
let thirdArticle = Article(title: thirdArticleTitle, imageName: thirdArticleImageName, subtitle: thirdArticleSubtitle, longDescription: thirdArticleLongDescription)
let fourthArticleTitle = "Natural and DIY Skin Care"
let fourthArticleImageName = "skin_care_4"
let fourthArticleSubtitle = "5 mins read"

let fourthArticleLongDescription = """
Title: Understanding Skin Concerns

In the realm of skincare, understanding your skin's unique needs is paramount to achieving a healthy and radiant complexion. Skin concerns can vary widely, ranging from common issues like acne and dryness to more complex conditions such as eczema and rosacea. By gaining insight into these concerns and their underlying causes, individuals can tailor their skincare routines to address specific issues effectively.

**Acne:**
Acne is one of the most prevalent skin concerns, affecting individuals of all ages. It occurs when hair follicles become clogged with oil and dead skin cells, leading to the formation of pimples, blackheads, and whiteheads. Factors such as hormonal fluctuations, genetics, and lifestyle habits can contribute to acne development. Treating acne often involves a combination of topical treatments, oral medications, and lifestyle modifications.

**Dryness:**
Dry skin lacks sufficient moisture, resulting in tightness, flakiness, and rough texture. External factors like harsh weather, hot showers, and harsh skincare products can exacerbate dryness, while internal factors such as age and genetics may also play a role. Hydrating ingredients like hyaluronic acid, glycerin, and ceramides can help replenish moisture levels and restore skin barrier function.

**Eczema:**
Eczema, also known as atopic dermatitis, is a chronic inflammatory skin condition characterized by red, itchy, and inflamed patches. It often develops in childhood but can persist into adulthood. Triggers for eczema flare-ups include allergens, irritants, stress, and climate changes. Treatment typically involves gentle skincare practices, moisturizers, topical corticosteroids, and, in severe cases, systemic medications.

**Rosacea:**
Rosacea is a chronic inflammatory disorder that primarily affects the facial skin, causing redness, visible blood vessels, and acne-like bumps. Triggers for rosacea flare-ups include sun exposure, hot beverages, spicy foods, alcohol, and stress. While there is no cure for rosacea, managing symptoms involves avoiding triggers, gentle skincare, and prescription medications such as topical creams and oral antibiotics.

**Hyperpigmentation:**
Hyperpigmentation refers to darkening of the skin caused by excess melanin production. Common types of hyperpigmentation include age spots, sunspots, and post-inflammatory hyperpigmentation (PIH) from acne or other skin injuries. Sun exposure, hormonal fluctuations, and inflammation contribute to its development. Treatment options include topical brightening agents, chemical peels, laser therapy, and microdermabrasion.

Understanding your skin concerns is the first step towards achieving healthy and radiant skin. By identifying specific issues and implementing targeted skincare solutions, individuals can effectively address their needs and maintain optimal skin health. Consulting with a dermatologist or skincare professional can provide personalized recommendations tailored to your unique skin concerns and goals.
"""

let fourthArticle = Article(title: fourthArticleTitle, imageName: fourthArticleImageName, subtitle: fourthArticleSubtitle, longDescription: fourthArticleLongDescription)

// Array to hold your articles
var articles: [Article] = [firstArticle, secondArticle,thirdArticle,fourthArticle]
