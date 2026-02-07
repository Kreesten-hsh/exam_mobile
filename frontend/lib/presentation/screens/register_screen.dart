// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../core/theme/app_theme.dart';
import '../common_widgets/custom_button.dart';
import '../common_widgets/custom_text_field.dart';
import '../riverpod/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _photoUrlController = TextEditingController();

  String _gender = 'M';
  DateTime? _birthDate;

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      if (_birthDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Veuillez sélectionner votre date de naissance'),
          ),
        );
        return;
      }

      await ref
          .read(authProvider.notifier)
          .register(
            _emailController.text,
            _passwordController.text,
            _firstNameController.text,
            _lastNameController.text,
            _gender,
            _birthDate!,
            photoUrl: _photoUrlController.text.isNotEmpty
                ? _photoUrlController.text
                : null,
          );
    }
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now().subtract(const Duration(days: 365 * 18)),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: AppTheme.lightTheme.copyWith(
            colorScheme: AppTheme.lightTheme.colorScheme.copyWith(
              primary: AppTheme.midnightBlue,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _birthDate) {
      setState(() {
        _birthDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.error.toString().replaceAll('Exception: ', '')),
            backgroundColor: AppTheme.errorRed,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppTheme.midnightBlue,
          ),
          onPressed: () => context.go('/login'),
        ),
        title: const Text('Inscription'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  label: 'Prénom',
                  controller: _firstNameController,
                  validator: (v) => v!.isEmpty ? 'Requis' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Nom',
                  controller: _lastNameController,
                  validator: (v) => v!.isEmpty ? 'Requis' : null,
                ),
                const SizedBox(height: 16),

                Text(
                  'Sexe',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.midnightBlue,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Homme'),
                        value: 'M',
                        groupValue: _gender,
                        activeColor: AppTheme.midnightBlue,
                        onChanged: (value) => setState(() => _gender = value!),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: const Text('Femme'),
                        value: 'F',
                        groupValue: _gender,
                        activeColor: AppTheme.midnightBlue,
                        onChanged: (value) => setState(() => _gender = value!),
                        contentPadding: EdgeInsets.zero,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Text(
                  'Date de naissance',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.midnightBlue,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: _selectDate,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.offWhite),
                      borderRadius: BorderRadius.circular(12),
                      color: AppTheme.pureWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _birthDate == null
                              ? 'Sélectionner une date'
                              : DateFormat('dd/MM/yyyy').format(_birthDate!),
                          style: _birthDate == null
                              ? Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(color: AppTheme.textGrey)
                              : Theme.of(context).textTheme.bodyLarge,
                        ),
                        const Icon(
                          Icons.calendar_today,
                          color: AppTheme.midnightBlue,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                CustomTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) => !v!.contains('@') ? 'Email invalide' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Mot de passe',
                  controller: _passwordController,
                  isPassword: true,
                  validator: (v) => v!.length < 6 ? 'Min 6 caractères' : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'Confirmer le mot de passe',
                  controller: _confirmPasswordController,
                  isPassword: true,
                  validator: (v) => v != _passwordController.text
                      ? 'Les mots de passe ne correspondent pas'
                      : null,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  label: 'URL Photo de profil (Optionnel)',
                  controller: _photoUrlController,
                  prefixIcon: Icons.link,
                ),

                const SizedBox(height: 32),
                CustomButton(
                  text: 'VALIDER L\'INSCRIPTION',
                  onPressed: _register,
                  isLoading: authState.isLoading,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
