module.exports = {
    students:{
        no_waiver: "1645309a-369e-49f2-889f-8df137197ca7",
        override_date:"988ba3c8-6ee0-46ec-bf58-a57d930b7373",
        override_price:"94637b1b-3299-4f33-9714-c427a0bb5aa6",
        override_prereq:"11c275d9-0e77-4aa3-aea9-6131b5c218ea",
        valid:"2b4c7a88-1b82-4166-8909-2462a0038f40",
        registered:"9cd5aa5d-74c3-462d-b80d-6bb5a1efa117",
        same_time:"",
        not_parent:"6e2add24-bc61-4c2d-9c31-eead851c0ded",
        prereq_before_event:"",
        two_b:"755314e8-f060-4416-a5f4-b1383d8b34eb", // private event override is not for this person, so they shouldnt be able to register
        refund_one:"a67ef66a-04f6-449e-83a0-a7256ba6339e",
        refund_two:"42e1eaad-eecb-407f-a2d8-98c38a5d5bb1",
        refund_three:"7841d18a-89ac-4f0e-a1bf-d70cffd9aa90",
        refund_four:"25d95f7b-e637-4809-b7a3-b57122f2a8c1"
    },
    events:{
        valid:"1c7441e7-56d1-4cf2-87c7-a0477a76d45f",
        fail_override_price:"418d2479-88b6-4495-ad22-bf7e51f90115",
        has_prereq:"55c6c9e3-e1d4-4ce7-9fb8-2c90fa7f7f2f",
        private:"e0023bf0-22d9-4816-affb-df1016f52f12",
        private_hash:"TestEventasdfghjklqwertyuiop",
        closed:"2bbe0924-0ef3-444f-bbcc-16a247d74abf",
        private_paid:"2c474702-8436-442e-b66c-3fb30fef8e22", //other uses requested this event
        private_hash_paid:"Paidedrftgyhujikkmjnhbgvctertrytuyiuo", //other uses requested this event
        private_cheat:"2f29f084-ef81-44de-b6bc-25ac2e03ef37",
        private_hash_cheat:"cheatwasedrftgyhujikomnbvtcrexsw"
    },
    users:{
        parent:"702651ae-0036-448e-bd7c-b9e6489bf822",
        other:"c417e4c3-e766-46fe-8158-74784dc3d76a",
        refund:"f0069369-94c0-4976-802d-fa8b5a414135"
    },
    codes:{
        valid:'ben13810f',
        closed:'z5ftqw85i',
        percent:'px6ixa4ho',
        camps:'4ccn8xi7b',
        labs:'1ynzhjaec',
        event:'x25nyw5xo',
        otherEvent:'v5bvq9xzd',
        user:'mne71837p',
        otherUser:'dm0p4g2ml',
        used:'39u99rvgc',
        disabled:'p7oqg3wag',
        big:'nvznr72t6'
    },
    addons:{
        valid:'4933050d-0dc3-43fc-b81d-439a54d49cd1',
        notValid:'20fa8f5c-d218-4b30-8e83-7bd2fbab148a',
        other:'7a3b7f4b-51cc-4216-a2c4-18f92923eb98'
    },
    stripeTokens:{
        valid:"tok_visa", //"tok_bypassPending", "tok_domesticPricing", "tok_avsUnchecked",
        fail_refund: "tok_refundFail",
        fail:["tok_chargeDeclined"]//"tok_avsFail", "tok_avsLine1Fail", "tok_avsZipFail", "tok_cvcCheckFail", "tok_riskLevelElevated", "tok_riskLevelHighest", , "tok_chargeDeclinedInsufficientFunds", "tok_chargeDeclinedFraudulent", "tok_chargeDeclinedIncorrectCvc", "tok_chargeDeclinedExpiredCard", "tok_chargeDeclinedProcessingError"]
    },
    emails:{
        valid:"bobby7083@gmail.com",
        invalid:"bobby@gmail.com"
    },
    passwords:{
        valid:"password",
        invalid:"potato"
    },
    payments:{
    }
}
