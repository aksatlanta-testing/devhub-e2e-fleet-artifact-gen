
{{- define "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.fullname" -}}
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


{{- define "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.labels" -}}
helm.sh/chart: {{ include "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.chart" . }}
{{ include "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo7a680dfc-ee40-4292-921f-9bb75a7c3056.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}