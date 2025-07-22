# task 1

# name = input("Enter Your Name : ").strip().capitalize()

# print(f"Welcome Back Mr.{name}")

# task 2

# age = int(input("Enter Your Age : "))

# message = (age < 16 and "Hello Your Age Is Under 16, Some Articles Is Not Suitable For You") \
# or        (age >= 16 and f"Hello Your Age Is {age}, All Articles Is Suitable For You")

# print(message)

# task 3

# first_name = input("Enter Your First Name : ").strip().capitalize()
# second_name = input("Enter Your Second Name : ").strip().capitalize()

# print(f"Hello Mr {first_name}.{second_name:.1s}") 

# task 4

# email = input("Enter Your Email : ").strip().lower()

# name = email[:email.index("@")].capitalize()

# print(f"Your Name : {name}")

# domainName = email[email.index("@") + 1 :]

# print(f"Domain Name : {domainName}")

# topLevelDomain = email[email.index(".") + 1:]

# print(f"Top Level Domain : {topLevelDomain}")

# other ways=

# # الحصول على البريد الإلكتروني من المستخدم
# email = input("Enter your email: ")

# # إزالة المسافات قبل وبعد البريد الإلكتروني وتحويل الحروف إلى حروف صغيرة
# email = email.strip().lower()

# # تقسيم البريد الإلكتروني إلى الأجزاء المكونة له
# username, domain = email.split('@')
# domain_name, top_level_domain = domain.split('.')

# # تحويل أول حرف من الاسم إلى حرف كبير
# username_capitalized = username.capitalize()

# # طباعة الرسائل المطلوبة
# print(f"Your Name Is {username_capitalized}")
# print(f"Email Service Provider Is {domain_name}")
# print(f"Top Level Domain Is {top_level_domain}")
