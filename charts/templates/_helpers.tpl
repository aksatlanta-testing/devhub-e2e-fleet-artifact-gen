
{{- define "go-echob670289a-8084-4797-a1ab-b9d979641fca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob670289a-8084-4797-a1ab-b9d979641fca.fullname" -}}
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


{{- define "go-echob670289a-8084-4797-a1ab-b9d979641fca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob670289a-8084-4797-a1ab-b9d979641fca.labels" -}}
helm.sh/chart: {{ include "go-echob670289a-8084-4797-a1ab-b9d979641fca.chart" . }}
{{ include "go-echob670289a-8084-4797-a1ab-b9d979641fca.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob670289a-8084-4797-a1ab-b9d979641fca.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob670289a-8084-4797-a1ab-b9d979641fca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}