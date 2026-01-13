# db/seeds.rb

# Типы приема пищи
breakfast = MealType.create(name: "Завтрак")
lunch = MealType.create(name: "Обед")
dinner = MealType.create(name: "Ужин")
snack = MealType.create(name: "Перекус")

# Категории еды
dairy = FoodCategory.create(name: "Молочные продукты")
meat = FoodCategory.create(name: "Мясо и Птица")
fruits = FoodCategory.create(name: "Фрукты")
grains = FoodCategory.create(name: "Крупы")

# Продукты
Product.create(name: "Творог 5%", calories: 121, proteins: 17, fats: 5, carbs: 1.8, food_category: dairy)
Product.create(name: "Куриная грудка", calories: 113, proteins: 23, fats: 1.9, carbs: 0.4, food_category: meat)
Product.create(name: "Яблоко", calories: 52, proteins: 0.3, fats: 0.2, carbs: 14, food_category: fruits)
Product.create(name: "Гречка", calories: 313, proteins: 12, fats: 3.3, carbs: 62, food_category: grains)

# Группы мышц
chest = MuscleGroup.create(name: "Грудь")
back = MuscleGroup.create(name: "Спина")
legs = MuscleGroup.create(name: "Ноги")

# Упражнения
Exercise.create(name: "Жим штанги лежа", description: "Базовое упражнение", muscle_group: chest)
Exercise.create(name: "Приседания", description: "Со штангой на плечах", muscle_group: legs)
Exercise.create(name: "Подтягивания", description: "Широким хватом", muscle_group: back)

# Тестовый пользователь
User.create(name: "Студент", email: "student@example.com", height: 180)
