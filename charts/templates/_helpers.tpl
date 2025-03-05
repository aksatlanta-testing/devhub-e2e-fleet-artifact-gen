
{{- define "go-echoee3c9822-8f4e-4860-a657-d72654d18508.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3c9822-8f4e-4860-a657-d72654d18508.fullname" -}}
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


{{- define "go-echoee3c9822-8f4e-4860-a657-d72654d18508.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoee3c9822-8f4e-4860-a657-d72654d18508.labels" -}}
helm.sh/chart: {{ include "go-echoee3c9822-8f4e-4860-a657-d72654d18508.chart" . }}
{{ include "go-echoee3c9822-8f4e-4860-a657-d72654d18508.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoee3c9822-8f4e-4860-a657-d72654d18508.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoee3c9822-8f4e-4860-a657-d72654d18508.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}