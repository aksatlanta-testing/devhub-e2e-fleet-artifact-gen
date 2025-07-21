
{{- define "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.fullname" -}}
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


{{- define "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.labels" -}}
helm.sh/chart: {{ include "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.chart" . }}
{{ include "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echod523e567-3a32-49e9-8816-b5d6269bd3ee.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}