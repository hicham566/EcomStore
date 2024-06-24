

class TPrincingCalculator{

  /// -- Calculate Prince based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;

  }
  /// -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// -- Calculate tax
  static String calculateTax(double productPrice, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    // Lookup the tax rate for given location from a taz rate database or API .
    // Return the appropriate tax rate .
    return 0.10; //Example shipping cost of 10%
  }

  static double getShippingCost(String location) {
    // Lookup the shopping cost for the given location using a shipping rate API.
    // Calculate the shipping cost based on various factors like distance, weight, etc.
    return 5.00; // Example shipping cost of 5$
  }

  /// -- Sum all cart values and return total amount
  // static double calculaterCarTotal(CartModel cart){
  // return cart.items.map( (e) => e.price).fold(0,(previousPrice, currentPrice) => previousPrice + (currentPrice ?? 0));
  // }

}
