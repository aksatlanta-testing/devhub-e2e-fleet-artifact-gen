
{{- define "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.labels" -}}
helm.sh/chart: {{ include "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.chart" . }}
{{ include "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoe7f8fe0b-5193-43cf-bf92-2883f72a681a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}