const functions = require("firebase-functions");

const express = require('express');

const app = express();

const stripe = require('stripe')(functions.config().stripe.testkey);



//create a payment intent
//send amount owed and request a client secret
//after client secret get the payment card.

exports.stripePayment = functions.https.onRequest(async (req, res) => {
    const paymentIntent = await stripe.paymentIntents.create({
        amount: req.body.amount,
        currency: 'usd',
    },
        function (err, paymentIntent) {
            if (err != null) {
                console.log(err);
            }
            else {
                res.json({
                    paymentIntent: paymentIntent.client_secret
                })
            }
        }
    )

})


