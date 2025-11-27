import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/contact.dart';

class SupabaseService {
  final SupabaseClient _supabase = Supabase.instance.client;

  Future<List<Contact>> getAllContacts() async {
    try {
      final response = await _supabase
          .from('contatos')
          .select()
          .order('id', ascending: true);
      
      return (response as List)
          .map((item) => Contact.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar contatos: $e');
    }
  }

  Future<List<Contact>> searchContacts(String nome) async {
    try {
      final response = await _supabase
          .from('contatos')
          .select()
          .ilike('nome', '%$nome%')
          .order('id', ascending: true);
      
      return (response as List)
          .map((item) => Contact.fromMap(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Exception('Erro ao buscar contatos: $e');
    }
  }

  Future<Contact> addContact(Contact contact) async {
    try {
      final data = contact.toMap();
      data.remove('id'); // Remove o id para inserção
      
      final response = await _supabase
          .from('contatos')
          .insert(data)
          .select()
          .single();
      
      return Contact.fromMap(response);
    } catch (e) {
      throw Exception('Erro ao adicionar contato: $e');
    }
  }

  Future<Contact> updateContact(Contact contact) async {
    try {
      if (contact.id == null) {
        throw Exception('ID do contato é necessário para atualização');
      }
      
      final data = contact.toMap();
      data.remove('id'); // Remove o id do update (não deve ser atualizado)
      
      final response = await _supabase
          .from('contatos')
          .update(data)
          .eq('id', contact.id!)
          .select()
          .single();
      
      return Contact.fromMap(response);
    } catch (e) {
      throw Exception('Erro ao atualizar contato: $e');
    }
  }

  Future<void> deleteContact(int id) async {
    try {
      await _supabase
          .from('contatos')
          .delete()
          .eq('id', id);
    } catch (e) {
      throw Exception('Erro ao deletar contato: $e');
    }
  }
}

