# db/seeds.rb

# 1. Типы приема пищи
MealType.find_or_create_by(name: "Завтрак")
MealType.find_or_create_by(name: "Обед")
MealType.find_or_create_by(name: "Ужин")
MealType.find_or_create_by(name: "Перекус")

# 2. Категории еды
dairy = FoodCategory.find_or_create_by(name: "Молочные продукты")
meat  = FoodCategory.find_or_create_by(name: "Мясо и Птица")
fruits = FoodCategory.find_or_create_by(name: "Фрукты")
grains = FoodCategory.find_or_create_by(name: "Крупы")
other  = FoodCategory.find_or_create_by(name: "Другое")

# 3. Продукты (Примеры)
Product.where(name: "Творог 5%").first_or_create(calories: 121, proteins: 17, fats: 5, carbs: 1.8, food_category: dairy)
Product.where(name: "Куриная грудка").first_or_create(calories: 113, proteins: 23, fats: 1.9, carbs: 0.4, food_category: meat)
Product.where(name: "Яблоко").first_or_create(calories: 52, proteins: 0.3, fats: 0.2, carbs: 14, food_category: fruits)
Product.where(name: "Гречка").first_or_create(calories: 313, proteins: 12, fats: 3.3, carbs: 62, food_category: grains)

# 4. Группы мышц
chest = MuscleGroup.find_or_create_by(name: "Грудь")
back  = MuscleGroup.find_or_create_by(name: "Спина")
legs  = MuscleGroup.find_or_create_by(name: "Ноги")

# 5. Упражнения
Exercise.where(name: "Жим штанги лежа").first_or_create(description: "Базовое упражнение", muscle_group: chest)
Exercise.where(name: "Приседания").first_or_create(description: "Со штангой на плечах", muscle_group: legs)
Exercise.where(name: "Подтягивания").first_or_create(description: "Широким хватом", muscle_group: back)

# 6. Тестовый пользователь
User.where(email: "student@example.com").first_or_create!(
  password: "password123",
  password_confirmation: "password123",
  name: "Студент"
)
