
{{- define "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.fullname" -}}
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


{{- define "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.labels" -}}
helm.sh/chart: {{ include "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.chart" . }}
{{ include "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echobefd0212-16b1-46f8-beb0-07b6a42efa28.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}