
{{- define "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.fullname" -}}
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


{{- define "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.labels" -}}
helm.sh/chart: {{ include "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.chart" . }}
{{ include "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf299d9a-0e5f-466b-aad2-166a346eae38.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}