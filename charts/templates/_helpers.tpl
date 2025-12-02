
{{- define "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.fullname" -}}
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


{{- define "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.labels" -}}
helm.sh/chart: {{ include "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.chart" . }}
{{ include "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo60bdb605-32d1-466a-8c32-6331a4333aab.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}