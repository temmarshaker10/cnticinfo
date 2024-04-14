/*
import 'dart:math';
double calculateProbability(int n, double p, int k) {
  // Calculate the binomial coefficient (n choose k)
  int binomialCoefficient = factorial(n) ~/ (factorial(k) * factorial(n - k));

  // Calculate the probability using the binomial distribution formula
  double probability = double.parse((binomialCoefficient * pow(p, k) * pow(1 - p, n - k)).toString());

  return probability;
}

int factorial(int n) {
  if (n <= 1) {
    return 1;
  } else {
    return n * factorial(n - 1);
  }
}
void bernouli({
  required int nbrTrial,
  required double nbrProba,
  required int nbrSuccess,
}){
  double probability = calculateProbability(nbrTrial, nbrProba, nbrSuccess);

  print('The probability of getting exactly $nbrSuccess heads in $nbrTrial flips is: $probability');
}
void main() {
  bernouli(nbrTrial: 5, nbrProba: 0.6, nbrSuccess: 3);
  /*int n = 5; // number of trials
  double p = 0.6; // probability of success in each trial
  int k = 3; // number of successes we want to calculate the probability for

  double probability = calculateProbability(n, p, k);

  print('The probability of getting exactly $k heads in $n flips is: $probability');
*/
}
  */

/*
import 'dart:math';

// Function to calculate the binomial coefficient (n choose k)
int binomialCoefficient(int n, int k) {
  if (k == 0  k == n) {
    return 1;
  }
  return binomialCoefficient(n - 1, k - 1) + binomialCoefficient(n - 1, k);
}

// Function to calculate the probability mass function (PMF) of the binomial distribution
double binomialPMF(int n, int k, double p) {
  int coefficient = binomialCoefficient(n, k);
  double q = 1 - p;
  return double.parse((coefficient * pow(p, k) * pow(q, n - k)).toString());
}
double expectedValue(int n, double p) {
  return n * p;
}
double variance(int n, double p) {
  return n * p * (1 - p);
}
void main() {
  int n = 5; // Number of trials
  double p = 0.5; // Probability of success
  for (int k = 0; k <= n; k++) {
    double pmf = binomialPMF(n, k, p);
    print("P(X = $k) = $pmf");
  }
}
*/
/*
import 'dart:math';

// Function to calculate the probability mass function (PMF) of a geometric distribution
double geometricPMF(int k, double p) {
  return pow(1 - p, k - 1) * p;
}

// Function to calculate the expected value (E(X)) of a geometric distribution
double geometricExpectedValue(double p) {
  return 1 / p;
}

// Function to calculate the variance (V(X)) of a geometric distribution
double geometricVariance(double p) {
  return (1 - p) / (p * p);
}

void main() {
  double p = 0.3; // Probability of success

  // Calculate and print PMF for the first 5 trials
  print("Probability Mass Function (PMF):");
  for (int k = 1; k <= 5; k++) {
    double pmf = geometricPMF(k, p);
    print("P(X = $k) = $pmf");
  }

  double e = geometricExpectedValue(p);
  double v = geometricVariance(p);

  print("Expected Value (E(X)): $e");
  print("Variance (V(X)): $v");
}
*/
/*
import 'dart:math';

// Function to calculate the binomial coefficient (n choose k)
int binomialCoefficient(int n, int k) {
  if (k == 0  k == n) {
    return 1;
  }
  return binomialCoefficient(n - 1, k - 1) + binomialCoefficient(n - 1, k);
}

// Function to calculate the probability mass function (PMF) of the hypergeometric distribution
double hypergeometricPMF(int N, int K, int n, int k) {
  int numerator = binomialCoefficient(K, k) * binomialCoefficient(N - K, n - k);
  int denominator = binomialCoefficient(N, n);
  return numerator.toDouble() / denominator.toDouble();
}

// Function to calculate the expected value (E(X)) of a hypergeometric distribution
double hypergeometricExpectedValue(int N, int K, int n) {
  return n * (K / N);
}

// Function to calculate the variance (V(X)) of a hypergeometric distribution
double hypergeometricVariance(int N, int K, int n) {
  return (n * K * (N - K) * (N - n)) / (N * N * (N - 1));
}

void main() {
  int N = 20; // Total number of items in population
  int K = 8; // Total number of successful items in population
  int n = 5; // Number of draws
  // Calculate and print PMF for all possible number of successful draws
  print("Probability Mass Function (PMF):");
  for (int k = 0; k <= min(K, n); k++) {
    double pmf = hypergeometricPMF(N, K, n, k);
    print("P(X = $k) = $pmf");
  }

  double e = hypergeometricExpectedValue(N, K, n);
  double v = hypergeometricVariance(N, K, n);

  print("Expected Value (E(X)): $e");
  print("Variance (V(X)): $v");
}
*/
/*

import 'dart:math';

double poissonProbability(int k, double lambda) {
  return (exp(-lambda) * pow(lambda, k)) / factorial(k);
}

int factorial(int n) {
  if (n <= 0) return 1;
  int result = 1;
  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  return result;
}

void main() {
  int k = 2; // Number of events
  double lambda = 1.5; // Average rate of occurrence

  double probability = poissonProbability(k, lambda);
  print('Probability of observing $k events: $probability');
}
*/
/*
// Function to calculate the probability mass function (PMF) of a Bernoulli distribution
double bernoulliPMF(int x, double p) {
  if (x == 1) {
    return p;
  } else if (x == 0) {
    return 1 - p;
  } else {
    return 0; // Invalid input
  }
}

// Function to calculate the expected value (E(X)) of a Bernoulli distribution
double bernoulliExpectedValue(double p) {
  return p;
}

// Function to calculate the variance (V(X)) of a Bernoulli distribution
double bernoulliVariance(double p) {
  return p * (1 - p);
}

void main() {
  double p = 0.7; // Probability of success

  // Calculate and print PMF for x = 0 and x = 1
  print("Probability Mass Function (PMF):");
  print("P(X = 0) = ${bernoulliPMF(0, p)}");
  print("P(X = 1) = ${bernoulliPMF(1, p)}");

  double e = bernoulliExpectedValue(p);
  double v = bernoulliVariance(p);

  print("Expected Value (E(X)): $e");
  print("Variance (V(X)): $v");
}
*/
import 'dart:math';

// Function to calculate binomial coefficient (n choose k)
int binomialCoefficient(int n, int k) {
  if (k == 0 || k == n) {
    return 1;
  }
  return binomialCoefficient(n - 1, k - 1) + binomialCoefficient(n - 1, k);
}

// Function to calculate binomial probability
double binomialProbability(int n, int k, double p) {
  int coefficient = binomialCoefficient(n, k);
  double q = 1 - p;
  double probability =
      double.parse((coefficient * pow(p, k) * pow(q, n - k)).toString());
  return probability;
}

void main() {
  int n = 5; // number of trials
  int k = 2; // number of successes
  double p = 0.5; // probability of success

  double probability = binomialProbability(n, k, p);
  print('Binomial Probability: $probability');
}
