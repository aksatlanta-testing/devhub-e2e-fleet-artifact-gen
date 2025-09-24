
{{- define "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.fullname" -}}
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


{{- define "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.labels" -}}
helm.sh/chart: {{ include "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.chart" . }}
{{ include "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoea65482b-5ac1-4514-8d7a-d2f54082576b.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}