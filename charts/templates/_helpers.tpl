
{{- define "go-echobd19af8b-d528-4801-8123-225a22dff979.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd19af8b-d528-4801-8123-225a22dff979.fullname" -}}
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


{{- define "go-echobd19af8b-d528-4801-8123-225a22dff979.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobd19af8b-d528-4801-8123-225a22dff979.labels" -}}
helm.sh/chart: {{ include "go-echobd19af8b-d528-4801-8123-225a22dff979.chart" . }}
{{ include "go-echobd19af8b-d528-4801-8123-225a22dff979.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobd19af8b-d528-4801-8123-225a22dff979.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobd19af8b-d528-4801-8123-225a22dff979.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}