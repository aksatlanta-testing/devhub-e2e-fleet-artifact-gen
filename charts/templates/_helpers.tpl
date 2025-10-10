
{{- define "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.fullname" -}}
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


{{- define "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.labels" -}}
helm.sh/chart: {{ include "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.chart" . }}
{{ include "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof1defbd5-656b-499a-adc6-ee1197e6c57a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}