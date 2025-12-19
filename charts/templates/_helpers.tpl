
{{- define "go-echo022ac0e3-3b52-405e-a306-05be117da55a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo022ac0e3-3b52-405e-a306-05be117da55a.fullname" -}}
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


{{- define "go-echo022ac0e3-3b52-405e-a306-05be117da55a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo022ac0e3-3b52-405e-a306-05be117da55a.labels" -}}
helm.sh/chart: {{ include "go-echo022ac0e3-3b52-405e-a306-05be117da55a.chart" . }}
{{ include "go-echo022ac0e3-3b52-405e-a306-05be117da55a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo022ac0e3-3b52-405e-a306-05be117da55a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo022ac0e3-3b52-405e-a306-05be117da55a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}