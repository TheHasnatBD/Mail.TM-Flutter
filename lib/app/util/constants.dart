/*
 * constants, PROJECT: mailtm
 * @author Abdullah Al-Hasnat
 */

class Constants {
  // ------------------- URLS --------------
  static const _BASE_URL = "https://api.mail.tm/";

  static const DOMAIN_LIST_API = _BASE_URL + "domains"; //GET, Query The Domain List
  static const CREATE_ACCOUNT_API = _BASE_URL + "accounts"; //POST, Create an Account
  static const LOGIN_API = _BASE_URL + "token"; //POST, Login Get JWT Token [ Bearer ]
  static const MESSAGE_LIST_API = _BASE_URL + "messages"; //GET, Check inbox


  //------------------- Preference KEYS ----------------------
  static const TOKEN_KEY = "token";
  static const DOMAIN_KEY = "domain";
  static const EMAIL_KEY = "email";
}