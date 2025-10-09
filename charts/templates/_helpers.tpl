
{{- define "go-echod492ec76-1414-4254-9eae-8b11eb70f480.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod492ec76-1414-4254-9eae-8b11eb70f480.fullname" -}}
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


{{- define "go-echod492ec76-1414-4254-9eae-8b11eb70f480.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod492ec76-1414-4254-9eae-8b11eb70f480.labels" -}}
helm.sh/chart: {{ include "go-echod492ec76-1414-4254-9eae-8b11eb70f480.chart" . }}
{{ include "go-echod492ec76-1414-4254-9eae-8b11eb70f480.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod492ec76-1414-4254-9eae-8b11eb70f480.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod492ec76-1414-4254-9eae-8b11eb70f480.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}