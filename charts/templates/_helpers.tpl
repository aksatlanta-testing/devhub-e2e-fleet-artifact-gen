
{{- define "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.fullname" -}}
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


{{- define "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.labels" -}}
helm.sh/chart: {{ include "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.chart" . }}
{{ include "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echob2deaaa2-134a-4426-902a-d2cc381c9ffa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}