
{{- define "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.fullname" -}}
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


{{- define "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.labels" -}}
helm.sh/chart: {{ include "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.chart" . }}
{{ include "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo18817dfb-dfe9-4a1a-bc2e-a7e35a984c16.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}