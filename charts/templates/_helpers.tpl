
{{- define "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.fullname" -}}
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


{{- define "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.labels" -}}
helm.sh/chart: {{ include "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.chart" . }}
{{ include "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo734caf18-a7cc-4f55-aac3-a91ee38100f6.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}