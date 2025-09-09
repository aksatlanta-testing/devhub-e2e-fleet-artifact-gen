
{{- define "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.fullname" -}}
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


{{- define "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.labels" -}}
helm.sh/chart: {{ include "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.chart" . }}
{{ include "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa705c039-acef-4f9b-8c27-72aa8dd2c61b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}