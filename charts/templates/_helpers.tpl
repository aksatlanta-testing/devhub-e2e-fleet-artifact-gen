
{{- define "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.fullname" -}}
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


{{- define "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.labels" -}}
helm.sh/chart: {{ include "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.chart" . }}
{{ include "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoadb61ca9-67b3-48b2-989c-8bf0e1d4394e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}